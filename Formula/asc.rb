# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.3.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.3.0/asc_6.3.0_macOS_arm64'
      sha256 'c460fff17553d5a0b982bb67d366188554ccce3da4fd28e38ecd24ceb05915f8'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.3.0/asc_6.3.0_macOS_amd64'
      sha256 'dab71b99396e45c8e14faa5341ebb759e02d826234d42401a97f83e9a75e92da'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.3.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.3.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
